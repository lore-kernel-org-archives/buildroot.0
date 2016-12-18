From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 11:16:37 +0100
Subject: [Buildroot] [PATCH 2/2] soletta: new package
In-Reply-To: <CAPi7W81=a+pP_3X3yfg=uZ+65SDpvpVy3M_2wwAFVchfLSFHCA@mail.gmail.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
 <1477419935-86355-2-git-send-email-fabrice.fontaine@orange.com>
 <20161217235236.06cc45a2@free-electrons.com>
 <CAPi7W81=a+pP_3X3yfg=uZ+65SDpvpVy3M_2wwAFVchfLSFHCA@mail.gmail.com>
Message-ID: <20161218111637.7f152e12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot mailing list in Cc when replying.

On Sun, 18 Dec 2016 11:07:25 +0100, Fabrice Fontaine wrote:

> > Have all those patches been submitted upstream?
> >  
> Only the first patch has been accepted upstream, I was working to integrate
> a second one but the project seems less active (no updates since November
> 13th) so this is still work in progress.

OK, thanks. At least it's in progress, which is good.

> > SOLETTA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-
> > python3,host-python)
> >  
> My issue is that soletta depends on host-python3, it will not build with
> host-python. However, if I do not also select python3 (which is not really
> needed at runtime), then host-python-jsonschema will be compiled for the
> default host-python interpreter which is host-python2. So, my issue is that
> I can not add a dependency on host-python*3*-jsonschema as this is not
> supported by buildroot.

It really depends on python3 ? No way to make it compatible with
python2 ?

If it really needs host-python3, then yes, we don't have any other
choice than doing what you did.

> I do not get this error, it seems that it is raised because the Makefile
> uses multiple targets inside a rule, for example:
> $(soletta_target) $(soletta_config): private export
> BOARD_NAME:=$(BOARD_NAME)
> 
> I think that multiple targets inside a rule is not supported by old
> versions of make, so it seems I will have to add another patch ;-)

I was testing on my autobuilder instance, which runs an old Debian. It
uses make 3.81.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
