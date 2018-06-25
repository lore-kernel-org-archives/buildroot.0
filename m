From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:35:18 +0200
Subject: [Buildroot] [PATCH 1/1] boost: fiber needs exception_ptr
In-Reply-To: <20180625184506.455-1-fontaine.fabrice@gmail.com>
References: <20180625184506.455-1-fontaine.fabrice@gmail.com>
Message-ID: <20180625213518.45fe3a6d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 20:45:06 +0200, Fabrice Fontaine wrote:
> fiber needs exception_ptr because context is a transient dependency of fiber

What do you mean by "transient" ? Perhaps you meant "transitive" ?

> that needs exception_ptr.
> An other option would be to make boost fiber depends on boost context
> (https://www.boost.org/doc/libs/1_67_0/libs/fiber/doc/html/fiber/overview.html)

If boost fiber relies on boost context, then boost fiber should select
boost context.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
