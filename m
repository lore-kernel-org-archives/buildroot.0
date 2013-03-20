From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Mar 2013 20:49:35 +0100
Subject: [Buildroot] [git commit] Added package HPLIP for printing to HP
	printers
In-Reply-To: <20130320191131.2fb8a9f5@skate> (Thomas Petazzoni's message of
 "Wed, 20 Mar 2013 19:11:31 +0100")
References: <20130319121031.EF25A9B19C@busybox.osuosl.org>
 <20130320191131.2fb8a9f5@skate>
Message-ID: <87fvzprgvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Tue, 19 Mar 2013 13:07:39 +0100, Peter Korsgaard wrote:

 >> diff --git a/package/Config.in b/package/Config.in
 >> index fec5020..e12228f 100644
 >> --- a/package/Config.in
 >> +++ b/package/Config.in
 >> @@ -640,6 +640,7 @@ source "package/connman/Config.in"
 >> source "package/ctorrent/Config.in"
 >> source "package/conntrack-tools/Config.in"
 >> source "package/cups/Config.in"
 >> +source "package/hplip/Config.in"

 Thomas> This breaks the rule of sorting alphabetically the packages. I
 Thomas> know it has been made to avoid the submenu related to Printing
 Thomas> stuff... but since Olivier is contributing more
 Thomas> printing-related packages, maybe the submenu was a better
 Thomas> option?

Agreed, if we end up with more printing packages we should make a
dedicated submenu for them (and move them out from network
applications).


 >> diff --git a/package/hplip/Config.in b/package/hplip/Config.in
 >> new file mode 100644
 >> index 0000000..5bcd63b
 >> --- /dev/null
 >> +++ b/package/hplip/Config.in
 >> @@ -0,0 +1,17 @@
 >> +config BR2_PACKAGE_HPLIP
 >> +	bool "hplip"
 >> +	depends on BR2_PACKAGE_CUPS
 >> +	select BR2_PACKAGE_LIBUSB
 >> +	select BR2_PACKAGE_JPEG

 Thomas> Missing 'depends on BR2_INSTALL_LIBSTDCPP' ...

Ahh yes, I missed this during the final review. Will fix now.

Thanks.

-- 
Bye, Peter Korsgaard
