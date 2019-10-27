From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:40:06 +0100
Subject: [Buildroot] [PATCH 2/9] package: do not override LICENSE,
 but append to it
In-Reply-To: <a5471d07b121c602735c2a48b84e33133dc71a91.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
 <a5471d07b121c602735c2a48b84e33133dc71a91.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <c32cdea5-af2b-8660-a326-4fc1425a9ac3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/10/2019 10:45, Yann E. MORIN wrote:
> Now that the infra takes care of removing extraneous spaces before
> commas, we can safely append to LICENSE variables.
> 
> This removes the only case where we had to use immediate assignment
> to append to a variable.
> 
> Mechanical change, with:
> 
>     $ sed -r -i -e 's/\<([^[:space:]]+_LICENSE) := \$\(\1\),/\1 += ,/' \
>         $(git grep -l -E '\<([^[:space:]]+_LICENSE) := \$\(\1\),')

 Great that you put the script in the commit message!

 Normally, we want a single patch per package, but in case of a mechanical
change I agree it's better to do all together.

 Regards,
 Arnout

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
