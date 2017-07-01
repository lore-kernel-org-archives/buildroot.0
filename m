From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 1 Jul 2017 09:14:50 +0200
Subject: [Buildroot] [PATCH 5/8 v3] tools: move size-stat-compare out of
	support/scripts/
In-Reply-To: <468a9d289f6ec103da257c160ef3f2b85558c108.1498859395.git.yann.morin.1998@free.fr>
References: <cover.1498859395.git.yann.morin.1998@free.fr>
 <468a9d289f6ec103da257c160ef3f2b85558c108.1498859395.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LU65t493q-X2crx-R5omYiX5nzbf9o1+Ndgp4ndzC6nOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

2017-06-30 23:50 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Move it to the top-level tools/ directory, so that it is easier to
> find for users.
>
> Add a legacy symlink for those users who already used them, so as
> not to break their habits.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/scripts/size-stats-compare | 128 +------------------------------------
>  tools/readme.txt                   |   5 ++
>  tools/size-stats-compare           | 127 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 133 insertions(+), 127 deletions(-)
>  mode change 100755 => 120000 support/scripts/size-stats-compare
>  create mode 100755 tools/size-stats-compare
>
[..]
> diff --git a/tools/readme.txt b/tools/readme.txt
> index ba7a2058a4..4d6d5fb62c 100644
> --- a/tools/readme.txt
> +++ b/tools/readme.txt
> @@ -17,6 +17,11 @@ get-developpers
>      of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
>      input, a package name or and architecture name.
>
> +size-stat-compare
> +    a script to compare the rootfs size between two differnt Buildroot

different

> +    configurations. This can be used to identify the size impact of
> +    a specific option, or of a set of specific options.

I would also add that it is useful when upgrading Buildroot release,
as is done in the description inside the script.
This is in fact the use case I originally wrote it for.


Best regards,
Thomas
