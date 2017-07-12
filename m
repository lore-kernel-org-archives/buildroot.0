From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 11 Jul 2017 17:30:28 -0700
Subject: [Buildroot] [PATCH] package/qt5base: Remove upstreamed 5.8.0
 patches
In-Reply-To: <20170711231116.5147a530@windsurf.lan>
References: <1499795800-712-1-git-send-email-joshua.henderson@microchip.com>
 <20170711231116.5147a530@windsurf.lan>
Message-ID: <9d1e8ca9-38a3-6302-825b-f73bf1ebac3b@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 07/11/2017 02:11 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 11 Jul 2017 10:56:40 -0700, Joshua Henderson wrote:
>> This removes the following patches that have been upstreamed:
>>
>> - qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch [1]
>> - qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch [2]
>> - qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch [3]
>> - qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch [4]
>>
>> And the following patches that do not appear to be upstream:
>>
>> - qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
>>
>> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
>> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
>> [3] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=5cc0de2e084cb887a75b076b82cf470ecdcd4dd3
>> [4] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e9a7739e77f79baeb5452189b6d17e63de5b341d
>>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> Cc: Julien Corjon <corjon.j@ecagroup.com>
>> Cc: Brent Sink <brents_3@hotmail.com>
> 
> How can this be a separate patch from the bump to Qt 5.9.1 ?
> 
> If you remove the Qt 5.8.0 patches, then Qt will fail to build, right?
> So the removal of the patches should be done as part of the patch
> bumping to 5.9.1.
> 

You are correct.  Send this to the trash pile.  I'll roll it in to the other patch, assuming you
don't come back with the option to keep this separate and put this in a patch series after the bump
to 5.9.1.

Now that I think about it, this could use a bit of clarification in the commit message above noted
as "do not appear to be upstream" which is only true for 5.8.  All patches in this folder are
upstream for 5.9.

Josh
