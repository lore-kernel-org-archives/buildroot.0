From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Nov 2013 23:29:11 +0100
Subject: [Buildroot] [PATCHv3 1/5] core: introduce the BR2_EXTERNAL
 variable
In-Reply-To: <1385591508-4174-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131128222911.GA18409@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-27 23:31 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> +# Handling of BR2_EXTERNAL. We are handling three cases here:
> +#
> +#  (Case 1) BR2_EXTERNAL is defined in the command line, but has an
> +#           empty value. That's an indication that the user wants to
> +#           remove the BR2_EXTERNAL value. So we use the
> +#           dummy-external directory as BR2_EXTERNAL and remove the
> +#           .br-external file.

Should be:
    [...] we use the dummy-external directory as BR2_EXTERNAL and store
    it in the .br-external file.

> +#  (Case 2) BR2_EXTERNAL is defined in the command line, and has a
> +#           non-empty value. That's an indication that the user wants
> +#           to use the provided location as the BR2_EXTERNAL. We
> +#           verify that the location exists, and if it's the case,
> +#           store it in .br-external.
> +#  (Case 3) BR2_EXTERNAL isn't defined in the command line. We load
> +#           the value from .br-external, verify that it exists and
> +#           then use it.

You're missing one case:

(Case 4) BR2_EXTERNAL is not defined on the command line, and
         BR2_EXTERNAL_FILE does not exist (first run). We set
         BR2_EXTERNAL to point to our dummy-external directory,
         and store it in the .br-external file.

This missing case is breaking the standard (no-BR2_EXTERNAL) build.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
