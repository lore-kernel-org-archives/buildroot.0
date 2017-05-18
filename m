From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 May 2017 13:51:26 -0500
Subject: [Buildroot] [PATCH v3 1/3] refpolicy: new package
In-Reply-To: <20170514174053.26140-2-Adamduskett@outlook.com>
References: <20170514174053.26140-1-Adamduskett@outlook.com>
 <20170514174053.26140-2-Adamduskett@outlook.com>
Message-ID: <CANQCQpaRQPFAtiYuEQ-MPwU6ZPHBLx3cHvXQkmLAx=ZgLYSNGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Sun, May 14, 2017 at 12:40 PM, Adam Duskett <aduskett@gmail.com> wrote:
> The patch is for adding selinux reference policy (refpolicy).
> It is a complete SELinux policy that can be used as the system policy
> for a variety of systems and used as the basis for creating other policies.
>

I pulled this in and tried to build our existing project which uses
our version of the patchset.  Here's what I ran into below. Is your
build machine by chance a selinux enabled distro?

Creating targeted policy.conf
cat tmp/pre_te_files.conf tmp/all_attrs_types.conf
tmp/global_bools.conf tmp/only_te_rules.conf tmp/all_post.conf >
policy.conf
Compiling and installing targeted
/accts/mlweber1/target_build/target/etc/selinux/targeted/policy/policy.
/usr/bin/checkpolicy -c 30 -U deny  policy.conf -o
/accts/mlweber1/target_build/target/etc/selinux/targeted/policy/policy.
make[2]: /usr/bin/checkpolicy: Command not found
make[2]: *** [/accts/mlweber1/target_build/target/etc/selinux/targeted/policy/policy.]
Error 127
make[1]: *** [/accts/mlweber1/target_build/build/refpolicy-cs_RELEASE_2_20170204/.stamp_target_installed]
Error 2
make: *** [_all] Error 2

Matt
