From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 23:45:24 +0200
Subject: [Buildroot] [PATCH] download/git: more resilient in case of kill
In-Reply-To: <20180409214155.24741-1-yann.morin.1998@free.fr>
References: <20180409214155.24741-1-yann.morin.1998@free.fr>
Message-ID: <20180409234524.4144b90b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 23:41:55 +0200, Yann E. MORIN wrote:

> +pushd "${git_cache}" >/dev/null

So you're doing the pushd here now.

> +
> +# Ensure the repo has an origin (in case a previous run was killed).
> +if git remote |grep -q -E '^origin$'
>      pushd "${git_cache}" >/dev/null

And therefore I'm not sure why it's needed here...

>      _git remote add origin "'${uri}'"
>      popd >/dev/null

... and this popd would no longer be needed.

>  fi
>  
> -pushd "${git_cache}" >/dev/null

I am missing something?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
