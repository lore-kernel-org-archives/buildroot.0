From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 09:37:40 +0200
Subject: [Buildroot] Controlling dependencies for package with manual
 Makefile
In-Reply-To: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E39@2putt.int.lantronix.com>
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E39@2putt.int.lantronix.com>
Message-ID: <20100708093740.045e621f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 7 Jul 2010 10:22:25 -0700
"Matthew Davison" <matt.davison@lantronix.com> wrote:

> I understand that for packages using the autotools infrastructure, that
> the PACKAGENAME_DEPENDENCIES variable (replacing PACKAGENAME
> appropriately) is used to tell buildroot to build these dependencies
> first. Setting this variable in a manual Makefile (non-autotools based),
> does not appear to work.
>  
> Is there a way to force buildroot to build package dependencies first,
> without having to convert to an autotools compliant Makefile?

As you later pointed out, it just a matter of doing:

yourpackage: yourdependency thetargetofyourpackage

However, do you have any reason for not using the AUTOTARGETS or
GENTARGETS infrastructures ? The <pkg>_DEPENDENCIES variable works with
both.

If your package is not autotools-based, you should definitely use the
GENTARGETS infrastructure. Manual Makefiles are no longer accepted in
Buildroot, and we're in the process of convering all existing packages
to GENTARGETS or AUTOTARGETS.

Don't hesitate to ask for any detail if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
