From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 23:15:52 +0200
Subject: [Buildroot] [PATCH 0/5] Introduce New Package PySnmp
In-Reply-To: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20131003231552.123a5212@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 3 Oct 2013 15:01:00 -0500, Ryan Barnett wrote:
> This patchset adds support for building PySnmp. One thing that I'm not
> sure on and am open to debate is the naming of the packages under
> Target Packages > Interpreter languages and scripting > external python
> modules in the menuconfig since the majority of the packages are named
> python-<pkg_name> but pygame and pyparsing don't fall under this
> category.
> 
> Menuconfig
>  -> python-nfc
>  -> python-protobuf
>  -> pygame
>  -> pyparsing
>  -> python-pyro
>  -> python-pyzmq
> 
> The make rules for the pygame and pyparsing packages are python-pygame
> python-pyparsing.
> 
> Location of the packages in buildroot is package/python-pygame and
> package/python-pyparsing.

Aaah, I now understand better what you were mentioning on IRC. Sorry
for not understanding earlier. I did understand that the name of the
package was "pyparsing", i.e that it was located in package/pyparsing/.
But indeed, it is located in package/python-pyparsing/, so the package
name is 'python-pyparsing'. The only thing that doesn't match is the
Config.in option prompt, and this is not nice.

So clearly, I'm all for changing the Config.in option name, i.e:

-	bool "pyparsing"
+	bool "python-pyparsing"

Thanks, and sorry again for the misunderstanding,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
