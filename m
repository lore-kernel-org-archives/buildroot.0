From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Nov 2018 08:56:56 +0100
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for
 python packages v2
In-Reply-To: <5be0f4fb15b71_1ffa2af2b3fab998208b9@ultri5.mail>
References: <20181105091555.484cb898@windsurf>
 <5be0f4fb15b71_1ffa2af2b3fab998208b9@ultri5.mail>
Message-ID: <20181106085656.425efe64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Mon, 05 Nov 2018 23:57:15 -0200, Ricardo Martincoski wrote:

> >  - Use an integer for the Python version variable, rather than a
> >    string, there is really no need for this to be a string I believe ?  
> 
> You are correct. There is no need for a string. I will use an integer.

On the other hand, this python_version = 2/3 is only one line, and it
saves only one line in the config fragment, BR2_PACKAGE_PYTHON=y or
BR2_PACKAGE_PYTHON3=y.

So we replace one fairly explicit line:

	BR2_PACKAGE_PYTHON=y

by just another line, which requires going to the base class to
understand what is does:

	python_version = 2

I.e, I am wondering if this refactoring is really useful in the end ?

> >  - Alternatively, you could derive the version of the Python
> >    interpreter to use from the child class name. Maybe this is too
> >    "implicit" and a bit tricky, but I wanted to mention this
> >    possibility. I.e, in the base class, you use
> >    self.__class__.__name__, and it gives you the actual name of the
> >    class that is instantiated. You can then check if the string
> >    contains Python2 or Python3, and decide which interpreter to use
> >    according to this. I am not saying I absolutely want this, I'm just
> >    offering this as an alternative solution.  
> 
> For comparison only, I created a patch on top of the wip v3:
> https://gitlab.com/RicardoMartincoski/buildroot/commit/c824c5dfe9c1b0953088c9a818575287fe984fc4
> 
> I guess/hope that using the explicit python_version is easier to understand for
> a newcomer.
> Maybe a matter of taste.

Yeah, I don't have a solid opinion on this. Perhaps the explicit
solution is more readable/clearer.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
