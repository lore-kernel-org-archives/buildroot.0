From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 12:02:40 +0100
Subject: [Buildroot] [PATCH next 2/2] package/luarocks: rework
 configuration file for per-package folders
In-Reply-To: <CAB0FRstV2av9OfDwr5DyKb=kyxSrk=eJ9fSuUp=LK-RXWGdtSA@mail.gmail.com>
References: <20181119103227.24726-1-thomas.petazzoni@bootlin.com>
 <20181119103227.24726-3-thomas.petazzoni@bootlin.com>
 <CAB0FRstV2av9OfDwr5DyKb=kyxSrk=eJ9fSuUp=LK-RXWGdtSA@mail.gmail.com>
Message-ID: <20181120120240.53e43cce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Mon, 19 Nov 2018 21:57:35 +0100, Fran?ois Perrad wrote:

> In fact, this patch is useless, the sandbox environment contains a field
> `os_getenv`.
> Just use `os_getenv` instead of `getenv` in luarocks-br-config.lua.
> 
> Another point, without defining a lot variables, the command
> `somewhere_host/bin/luarocks --help` fails
> with the message : attemps to concatenate a nil value (when loading the
> config file)
> 
> So, add something like this, on the top of luarocks-br-config.lua :
>     local function getenv (name) return os_getenv(name) or '' end

Thanks for the feedback! I will send an updated version soon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
