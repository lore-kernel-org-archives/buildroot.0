From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 15:46:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
	external-toolchain gcc uClibc
In-Reply-To: <20090330153259.0a7ee398@surf> (Thomas Petazzoni's message of
	"Mon\, 30 Mar 2009 15\:32\:59 +0200")
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf>
Message-ID: <87ab73azsj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> They are misleading because these options cannot be
 Thomas> enabled/disabled: the external toolchain has already been
 Thomas> compiled. However, they must be set *according* to how the
 Thomas> external toolchain was compiled.

True.

 Thomas> I'm sure there was an issue with how I solved this problem,
 Thomas> but I don't see which one. Could you explain it again ?

The change was done by Daniel Laird back in January (r25170), and was
afaik because the options for external toolchains weren't in sync with
the ones for internal toolchains (WCHAR or LIBSTDCPP or something like
that missing), which meant that the packages depending on those
toolchain options couldn't be selected in kconfig.

See
http://lists.busybox.net/pipermail/buildroot/2009-January/025473.html
for the thread about it.

Now, the current approach is certainly nice from a maitenance POV as
there's only one set of options so they are always in sync, but I
agree that it isn't that userfriendly.

Daniel, what do you say?

-- 
Bye, Peter Korsgaard
