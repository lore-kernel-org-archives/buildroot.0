From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Thu, 27 Aug 2015 11:12:47 +0200
Subject: [Buildroot] [PATCH] pacakge/qt5/qt5base: fix build with ccache
In-Reply-To: <20150827105450.100164af@free-electrons.com>
References: <1440499298-39957-1-git-send-email-benoit@wsystem.com>
 <20150826154534.3e67c9bc@free-electrons.com>
 <CA+sos7-LVKNjkVc+1hg0w8WZMGEtnthaJnaA7-fUKEOizjJCeg@mail.gmail.com>
 <55DEC67C.6000500@wsystem.com> <20150827105450.100164af@free-electrons.com>
Message-ID: <55DED48F.3030102@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 27/08/2015 10:54, Thomas Petazzoni wrote:
> On Thu, 27 Aug 2015 10:12:44 +0200, Beno?t Th?baudeau wrote:
> 
>>> As explained in this report, I think that your suggestion would work
>>> for Buildroot (not yet tested), but not for upstream Qt.
>>>
>>> My point with this patch was that upstream could consider this
>>> Buildroot use case as illegal because the definition of QMAKE_CXX
>>> (http://doc.qt.io/qt-5/qmake-variable-reference.html#qmake-cxx) only
>>> mentions a filename and a path as possibilities. In that case, the bug
>>> is in Buildroot, and since this sanity check of the compiler is not
>>> needed for Buildroot, we can just remove this test. If we don't want a
>>> local patch for this, maybe we could use a wrapper above ccache, or
>>> put ccache into QMAKE_CXX and the compiler into QMAKE_CXXFLAGS (not
>>> tested, and a bit ugly).
>>>
>>> Wait and see what upstream says.
>>
>> Upstream recommends this approach:
>> http://lists.qt-project.org/pipermail/qt-creator/2014-January/003148.html
>>
>> What do you think?
> 
> Well, we already have a wrapper for the compiler in the case of the
> external toolchain. And we will probably also extend the wrapper in the
> future to the internal toolchain case, in order to support per-package
> staging directory. In this case, we could take advantage of this
> wrapper to include the ccache functionality, and avoid having CC and
> CXX values that have two words.
> 
> I really would like to have the wrapper suggested in this e-mail
> calling our wrapper, then calling the real compiler.

OK, but in the meantime, until we have a wrapper for the internal toolchain too,
what do you want to do to fix the current build failure?
 - Forbid the use of ccache with Qt 5?
 - Use the current patch?
 - Use the wrapper from the URL above? In that case, where would you put it in
   Buildroot (qt5base, new package, toolchain, support)?

Best regards,
Beno?t
