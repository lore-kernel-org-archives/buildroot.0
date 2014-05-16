From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 May 2014 13:26:08 -0300
Subject: [Buildroot] [PATCH v2 1/1] Rebuild packages when their external
 config is updated
In-Reply-To: <1400253776-21759-2-git-send-email-sojka@merica.cz>
References: <1400253776-21759-1-git-send-email-sojka@merica.cz>
 <1400253776-21759-2-git-send-email-sojka@merica.cz>
Message-ID: <53763C20.1050408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/16/2014 12:22 PM, Michal Sojka wrote:

> Packages like busybox, Linux kernel or uclibc can "import" their
> configuration files from external location specified either in
> buildroot's .config or in an environment variable. Currently, this
> import happens only when the package is built for the first time. When
> the external config changes later, the package is not rebuilt with the
> updated configuration until the corresponding .stamp_configured file
> is manually deleted. This patch changes this to automatically rebuild
> the package, when its external configuration files is newer than
> .stamp_configured.

This is an extremely bad idea for uclibc, ABI compatibility is not
guaranteed and changes to the configuration make it change in
incompatible ways, hence you'd need to rebuild everything if this happens.
Unless i'm missing something you're not considering this scenario.
Regards.
