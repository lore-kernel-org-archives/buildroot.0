From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 10:31:41 +0100
Subject: [Buildroot] [PATCH 1/1] openipmi: add OPENIPMI_VERSION_MAJOR
 variable
In-Reply-To: <1451548770-2968-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1451548770-2968-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20151231103141.580e0bfc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy,

On Thu, 31 Dec 2015 08:59:30 +0100, Jerzy Grzegorek wrote:

> -OPENIPMI_VERSION = 2.0.21
> -OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
> -OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
> +OPENIPMI_VERSION_MAJOR = 2.0
> +OPENIPMI_VERSION = $(OPENIPMI_VERSION_MAJOR).21
> +OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
> +OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%20$(OPENIPMI_VERSION_MAJOR)%20Library

I believe this is going a bit too far because what's encoded in the URL
here is not really the "major version", but the name of the project,
which is "OpenIPMI 2.0 Library".

So in this case, I don't think using the _VERSION_MAJOR thing is really
appropriate.

Let's see what others think about it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
