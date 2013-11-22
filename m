From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 21:58:43 +0100
Subject: [Buildroot] [PATCH 1/1] Add support to set the default port for
 dropbear to listen on
In-Reply-To: <528FBBDA.6020105@mind.be>
References: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
 <528FBBDA.6020105@mind.be>
Message-ID: <20131122205843.GA3371@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeroen, All,

On 2013-11-22 21:17 +0100, Arnout Vandecappelle spake thusly:
> On 22/11/13 19:10, jeroen.de.wachter at telenet.be wrote:
> >A menu entry has been added to set the port. This menu entry
> >is processed like entries that were already present and will
> >rewrite one line of the options.h file that is used by
> >dropbear during compilation.
> >
> >Signed-off-by: Jeroen De Wachter<jeroen.de_wachter@alcatel-lucent.com>
> 
>  Hi Jeroen,
> 
>  Thank you for your patch. However, I don't think we will accept it in
> buildroot. We could make thousands of configuration options that deal with
> all possible fine-grained tweaking. And especially in this particular case,
> the option is quite invasive (requires 5 additional lines in the .mk file)
> and it is possible to achieve the same result by adding a command-line
> option to dropbear, by including a custom S50dropbear to your fs-overlay.

Agreed. We've already declined to apply such changes in the past, on the
ground that this kind of run-time configuration should be delegated to
either one of:
  - a post-build script (BR2_ROOTFS_POST_BUILD_SCRIPT)
  - a rootfs-overlay (BR2_ROOTFS_OVERLAY)

The basic idea is that Buildroot should install default, sane config
files in /etc, and startup scripts, that provide the standard behaviour
of the package (when that makes sense), and that further project-specific
customisation is out-of-scope for Buildroot (but Buildroot offers the
rootfs-overlay and post-{build,image} scripts for that).

Also, I do not like the way this change tweaks the code between the
extract and patch steps. If that was to be accepted at all, then this
should be done with a real patch file, not a sed expression.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
