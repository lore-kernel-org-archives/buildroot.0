From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 27 Jul 2017 18:34:52 -0400
Subject: [Buildroot] [PATCH 1/1] host-mariadb: add host-openssl
	dependency
In-Reply-To: <20170727171043.076dd40d@windsurf.lan>
References: <20170727133548.30285-1-aduskett@gmail.com>
 <20170727171043.076dd40d@windsurf.lan>
Message-ID: <CAFSsvmoJFa01=6uQzaS6YvXoE6Zs=05D1RxW42Ws+4EL6Gmtmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Thu, Jul 27, 2017 at 11:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 27 Jul 2017 09:35:48 -0400, Adam Duskett wrote:
>> On Fedora26, openssl 1.1.x is included by default.  This causes build errors
>> when building the host variant of mariadb. Adding host-openssl as a dependency
>> fixes this issue.
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
> I don't think this is the correct fix. Indeed, host-mariadb builds just
> fine on a system where the OpenSSL headers/development files are *NOT*
> installed.
>
> This means that host-mariadb does not require host-openssl, but uses
> OpenSSL if available. So the proper solution is to pass some option at
> configure time to tell host-mariadb to not attempt to use OpenSSL.
> Indeed, we are not really interested in having OpenSSL support in
> host-mariadb.
>
True; what about if host-openssl is already selected?

> It apparently needs an SSL implementation, but has a small bundled one
> based on yassl. Can you try:
>
> HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
>
> and see if it fixes the problem for you ?
This works and properly builds mariadb.  That being said; should is there
a way to check if host-openssl is already selected? Or does it not matter?
>
> You can try to compare the build time of host-mariadb + host-openssl
> vs. host-maria-db + bundled SSL.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
