From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 8 Apr 2019 19:09:31 +0300
Subject: [Buildroot] Failed host-flex build after merge with nightly
 buildroot
In-Reply-To: <CAOqJNTf0u4_YTsVMuKT0pkSDU3jDWmLh3=JbJPY4O7kge02qmw@mail.gmail.com>
References: <CAOqJNTf0u4_YTsVMuKT0pkSDU3jDWmLh3=JbJPY4O7kge02qmw@mail.gmail.com>
Message-ID: <20190408160931.GA1122@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ??????, All

On Mon, Apr 08, 2019 at 07:00:44PM +0300, ?????? ????? wrote:
> I use master of buildroot for develop linux image, and periodical merge my
> system with last master. After last merge, build host-flex failsed with
> error:
> 
> >>> host-flex 2.6.4 Configuring
> buildroot_1  | >>> host-flex 2.6.4 Gettextizing
> buildroot_1  | /bin/bash: -c: line 1: syntax error: unexpected end of file
> buildroot_1  | make: ***
> [/ntc_image/standard/output/build/host-flex-2.6.4/.stamp_configured] Error 1
> buildroot_1  | package/pkg-generic.mk:228: recipe for target
> '/ntc_image/standard/output/build/host-flex-2.6.4/.stamp_configured' failed
> 
> How i can find source of this error?
> 
> Regards,
> Sakhno Serhii

Yes, the issue belongs to gettext-tiny adding, but the below patch
should fix the it:

	https://patchwork.ozlabs.org/patch/1081071/

Sorry for making this issue happen :(

Regards,
Vadim Kochan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
