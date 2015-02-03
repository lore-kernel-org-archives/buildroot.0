From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 3 Feb 2015 11:35:38 +0100
Subject: [Buildroot] [PATCH v6 16/16] ejabberd: new package.
In-Reply-To: <20150203105629.0abbbe46@free-electrons.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-17-git-send-email-johan.oudinet@gmail.com>
 <20150203105629.0abbbe46@free-electrons.com>
Message-ID: <CAJtjsKaX3Uf=V8yKDaSDCJMNPTW2Fv=eesGyxhU=vqq-cM0Oiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tue, Feb 3, 2015 at 10:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> +EJABBERD_DEPENDENCIES = openssl host-erlang-lager erlang-lager \
>
> I'm interested in hearing a bit more about the host-erlang-lager
> dependency. Why would ejabberd need a logging framework built for the
> host? This seems weird.

I also think it's weird but otherwise ejabberd compilation failed at
src/gen_mod.erl, which includes include/logger.hrl.
At line 23 of this file there is such statement:
-compile([{parse_transform, lager_transform}]).
And lager_transform is provided by erlang-lager.

I'm not an erlang guru but from lager documentation, it says this line
must be added to "the module you wish to compile with logging
enabled".
So, I guess it needs host-erlang-lager to add such capability to the
erlang compiler.
If an erlang expert reads this, it probably can provide a better explanation.

-- 
Johan
