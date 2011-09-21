From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 10:22:16 +0200
Subject: [Buildroot] [PATCH 2 of 5] toolchain-external: allow
 downloading a custom toolchain
In-Reply-To: <20110921095843.453ca812@skate>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <d181fc061658f56665ec.1316588132@localhost6.localdomain6>
 <20110921095843.453ca812@skate>
Message-ID: <CAAXf6LX5Fxme9tHcKVmk92Z2E4cptuGCQ7wyGUZO3PbZQeoZXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 21, 2011 at 9:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 21 Sep 2011 08:55:32 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Custom external toolchains currently already have to be extracted by the user.
>> This patch adds support for downloading a custom toolchain in the form of a
>> tarball, which will be extracted by buildroot.
>
> I like this feature, but I think I'd prefer to clearly separate the
> cases of "local custom toolchain" and "remote custom toolchain".
>
> So, in the toolchain choice :
>
> ?* All the CodeSourcery toolchains
> ?* Local custom toolchain
> ?* Remote custom toolchain
>
> When Local custom toolchain is selected, show :
> ?* Path of the toolchain
> ?* Prefix of the toolchain
>
> When Remote custom toolchain is selected, show :
> ?* URL of the toolchain tarball (please don't split site and source in
> ? the configuration, we don't do that in any other place in Buildroot,
> ? and it's really strange for the user to have to split the URL in two
> ? parts)
> ?* Prefix of the toolchain
>
> What do you think ?
>

For me it's fine to keep the distinction, but be aware that the
local/remote naming may be confusing: if a user receives a toolchain
tarball from e.g. a hardware manufacturer and saves it to his disk, I
would call it 'local'. But that user would typically like to use the
'remote' rules so that he does not need to unpack the toolchain
himself.

Maybe we should call it 'custom toolchain tarball' versus 'custom
unpacked toolchain' or something alike. The tarball can be either
local (file://something) or remote (http, ftp, scp, ...).

Best regards,
Thomas

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
