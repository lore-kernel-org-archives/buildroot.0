From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 16:56:17 +0100
Subject: [Buildroot] Change package version in buildroot.
In-Reply-To: <54BE1A0E.8000004@gmail.com>
References: <54BE1A0E.8000004@gmail.com>
Message-ID: <20150120165617.669d2e02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Piotr Rudzki,

On Tue, 20 Jan 2015 10:04:14 +0100, Piotr Rudzki wrote:

> I'm trying to change version of package in buildroot. I've copied files
> from package/squashfs to proper path in $BR2_EXTERNAL and changed
> version of sources to 4.2.

This is not supported. The $BR2_EXTERNAL mechanism can only be used to
add distinct packages from the ones available in Buildroot itself. You
cannot use it to override packages that exist in Buildroot with the
same name.

Possible solutions are:

 *) Create a new package with a different name in your $BR2_EXTERNAL
    directory.

 *) Change Buildroot itself, and keep your changes in a separate branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
