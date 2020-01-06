From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:36:09 +0100
Subject: [Buildroot] [PATCH 00/22] Bump ejabberd to version 19.09.1
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106213609.6b8b25ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

On Mon,  6 Jan 2020 17:10:53 +0100
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> Ejabberd has many dependencies. Bump all of them to the versions
> required by ejabberd-19.09.1.

Thanks for the patch series, I have applied it all, but there were a
few issues. See below for some general comments.

> Johan Oudinet (22):
>   erlang-p1-utils: Bump to version 1.0.16
>   erlang-lager: Bump to version 3.6.10
>   erlang-eimp: Bump to version 1.0.12
>   erlang-p1-cache-tab: Bump to version 1.0.20
>   erlang-p1-oauth2: Bump to version 0.6.5
>   erlang-p1-sip: Bump to version 1.0.30
>   erlang-p1-stringprep: Bump to version 1.0.17
>   erlang-p1-tls: Bump to version 1.1.2
>   ejabberd-p1-stun: Bump to version 1.0.29

Problem in the commit title: the package name is erlang-p1-stun, not
ejabberd-p1-stun.

>   erlang-p1-xml: Bump to version 1.1.37
>   erlang-p1-zlib: Bump to version 1.0.6
>   erlang-p1-xmpp: Bump to version 1.4.2
>   erlang-p1-yaml: Bump to version 1.0.21

For all those version bumps, the commit title format should have been:

	package/foo: bump to version XYZ

i.e "package/foo" as the prefix, and bump instead of Bump.

One useful addition would be to add the hash of the license file in the
.hash file of those packages.

>   erlang-base64url: New package
>   erlang-jose: New package
>   erlang-idna: New package
>   erlang-p1-mqtree: New package
>   erlang-p1-pkix: New package
>   erlang-p1-yconf: New package
>   erlang-p1-acme: New package

For all those packages:

 - You missed the update to the DEVELOPERS file

 - The "erlang" dependency added in <pkg>_DEPENDENCIES was not needed
   as it is implied by the rebar-package infrastructure

 - The hash of the license file was missing.

 - The commit title should have been: "package/foo: new package"

>   ejabberd: Bump to version 19.09.1

Same as previous version bumps on the commit title.

>   erlang-p1-iconv: Remove package

This one lacked an updated to the Config.in.legacy file.

I fixed all those minor details, and applied. As I mentioned above, it
would be good to add the hash of the license file in all Erlang
packages that don't have it yet.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
