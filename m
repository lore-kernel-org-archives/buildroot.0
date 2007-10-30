From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 30 Oct 2007 20:36:39 +0100
Subject: [Buildroot] BUG: ncftpbookmarks fails when building ncftp	utils.
In-Reply-To: <6090c5eb0710290819s485f9e9dw581599ad5a97f9da@mail.gmail.com>
References: <6090c5eb0710290819s485f9e9dw581599ad5a97f9da@mail.gmail.com>
Message-ID: <1193772999.4478.22.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-10-29 klockan 16:19 +0100 skrev Jorge S.:
> Hi All,
> 
> Ncftp package fails if you've  selected "utils". 
> 
> It fails while trying to make the "install -m 0755
> <path>/ncftpbookmarks" after compiling.
> 
> Since i don't need ncftpbookmarks, i solved this changing this in
> ncftp.mk:
> 
> ORIGINAL:
> 
> ifeq ($(strip $(BR2_PACKAGE_NCFTP_UTILS)),y)
> NCFTP_TARGET_BINS+=ncftpbatch ncftpbookmarks ncftpget ncftpls ncftpput
> endif
> 
> 
> MODIFIED (simply removed ncftpbookmarks): 
> 
> ifeq ($(strip $(BR2_PACKAGE_NCFTP_UTILS)),y)
> NCFTP_TARGET_BINS+=ncftpbatch ncftpget ncftpls ncftpput
> endif
> 
> 
> It works fine now.
> 
> I can submit a patch if someone interested.
> 
Is it not better to have a Config.in item
to allow the user to select which utilities
and then have "ncftpbatch ncftpget ncftpls ncftpput"
selected as defaults and anything else unselected.


> 
> Regards, 
> 
> Jorge.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
