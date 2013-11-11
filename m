From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 11 Nov 2013 23:49:11 +0100
Subject: [Buildroot] [PATCH 1 of 6 v2] legal info: fix saving of host
 package licenses
In-Reply-To: <e07dc5f55104adb4a171.1381151708@argentina>
References: <patchbomb.1381151707@argentina>
 <e07dc5f55104adb4a171.1381151708@argentina>
Message-ID: <52815EE7.6020305@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Thomas De Schampheleire wrote:
> Due to some tricky make behavior, the license texts of host packages that
> did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
> The problem is that you cannot correctly use a variable defined/updated
> inside a call'ed block as input to a foreach statement. If you try to use
> $(FOO) then only the original value of FOO is used for foreach, any update
> inside the call'ed block is ignored. However, if you use $$(FOO), the entire
> contents of FOO (typically a list of items) is passed as one item to
> foreach, thus causing just one iteration instead of several.
>
> To fix the problem, one should only use values in foreach that have not
> changed inside the call'ed block. In the case of (HOST_)FOO_LICENSE_FILES,
> this means repeating the checks for a valid HOST_FOO_X and using FOO_X as
> fallback.
>
> Additionally, a few empty lines have been added to the legal-info-foo block
> for clarity, as the amount of nested ifdef/ifeq statements have become very
> high.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

It is not clear to me whether this is a bug in make or something 
"intended". Do you have any more insight?

In either case, it's great you noticed and fixed it, thanks!

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
