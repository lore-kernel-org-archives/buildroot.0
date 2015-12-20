From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 16:28:54 +0100
Subject: [Buildroot] [PATCH v3] support/misc: Adding Vagrant file for
 provisioning
In-Reply-To: <1447887095-16773-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1447887095-16773-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20151220152854.GF3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-11-18 23:51 +0100, Angelo Compagnucci spake thusly:
> This patch adds a Vagrant file to buildroot. With this file
> you can provision a complete buildroot developing environment
> in minutes on all major platforms (Linux/Mac/Windows).
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[--SNIP--]
> diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
> index 3437f93..84e1f54 100644
> --- a/docs/manual/getting.txt
> +++ b/docs/manual/getting.txt
> @@ -10,6 +10,20 @@ November. Release numbers are in the format YYYY.MM, so for example
>  
>  Release tarballs are available at http://buildroot.org/downloads/[].
>  
> +An official https://www.vagrantup.com/[Vagrantfile] is distributed within buildroot for your needs.
> +If you want to setup an isolated buildroot environment on Linux or
> +Mac Os X, paste this line onto your terminal:
> +
> +--------------------
> +curl -O http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile; vagrant up
> +--------------------
> +
> +If you are on Windows, paste this into your powershell:
> +
> +--------------------
> +(new-object System.Net.WebClient).DownloadFile("http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile","Vagrantfile"); vagrant up
> +--------------------
> +
>  If you want to follow development, you can use the daily snapshots or
>  make a clone of the Git repository. Refer to the
>  http://buildroot.org/download[Download page] of the Buildroot website
> diff --git a/docs/website/download.html b/docs/website/download.html
> index a6c2ac0..00e24bc 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html

Please keep lines <= 80 chars.

Also, I would prefer we do not suggest that this is the recommended way
to run Buildroot. The way you state it: "an official vagrantfile...",
"setup an isolated buildroot environment", makes it sound like that's
highly suggested people use that. I would really like that we explicitly
state that this is provided for convenience to quickly set up a working
environment, but that it is in no way the official way of working (much
less the only official way).

Also, I prefer that there is only one command per line:

    wget blablabla
    vagrant up

Furthermore, I'm not too happy with those download-and-execute stuff.
Why don't we just tell the user to git-clone or download the tarball,
and tell them the Vagrant file is in support/misc/Vagrantfile and let
them deal with that on their own. If they want to use Vagrant, they sure
know how to do it, right?

Finally, I'd just move that out of "Getting Buildroot" into the "system
requirements" chapter, after the "amdatory packages" and before the
"optional packages" chapters.

What I suggest we add is just something like:

    ---8<--- docs/manual/prerequisite.txt
    For your convenience, so you can quickly get up and running with
    Buildroot, we provide a https://www.vagrantup.com/[Vagrantfile] to
    quickly set up a minimal working environment for testing purproses.
    The Vagrant file is located in `support/misc/Vagrantfile` in the
    Buildroot source tree.

    .Note
    This Vagrant file is in not the official way of using Buildroot,
    and is really just provided for convenience to quickly get started.
    You are free to use a classic Linux distribution to run Buildroot,
    and in fact most Buidlroot developpers are doing so and are not
    using that Vagrant file.
    ---8<---

This part is not required: it's already in the manual.

<rant of an old grey beard>
I'm not too fond of all those "tools-of-the-new-millenium". After
Vagrant, are we supposed to add a Puppet or a Chef configuration? Both?
Then what? Docker and/or Rocket files? Oh, may I add a recipe for
creating a chroot? ;-)
</rant>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
