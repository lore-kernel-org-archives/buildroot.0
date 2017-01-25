From: Lionel Flandrin <lionel@svkt.org>
Date: Wed, 25 Jan 2017 15:50:21 +0100
Subject: [Buildroot] [PATCH 1/2] python-flask: bump to version 0.12
In-Reply-To: <CAGm1_ksOzrvqpvf6=-A5tiezcKhZuo5-PK+UpzmhNLKNp-_Rvw@mail.gmail.com>
References: <20170125091854.2kwm43d3ncxbfdhp@ed>
 <CAGm1_kv4xehMCtxw+VG2ccHS7F8WsOzwQYrxSq+CVPk02mXGRA@mail.gmail.com>
 <20170125095858.x6lh5xjwby5lav3m@ed>
 <CAGm1_ku-nNH0va1aACBvcea6ypYg6R_U7jjAzOktxav0cBvjjA@mail.gmail.com>
 <20170125102228.ykcq4xsa5xnp7yar@ed>
 <CAGm1_ksjuWGAFNX+HggMp1QaOoUAdBPkwV78+EPY1oq18qVEtQ@mail.gmail.com>
 <20170125121659.5eaex6iynmrbrxb4@ed>
 <CAGm1_kv15AZWDZC82Zup4JMd+RrMjxe4Qn=Hrhu27jM_RB5VHg@mail.gmail.com>
 <20170125130241.5jwsxvs67a5qd2xc@ed>
 <CAGm1_ksOzrvqpvf6=-A5tiezcKhZuo5-PK+UpzmhNLKNp-_Rvw@mail.gmail.com>
Message-ID: <20170125145021.5a2sw6ha7yewpkqw@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 25, 2017 at 03:19:25PM +0100, Yegor Yefremov wrote:
[snip]
> I don't think this will be fixed upstream [1]. So I just made the same
> fix we've made for python-serial. Please test my patch.
> 
> [1] https://github.com/pallets/jinja/issues/662
> 

I'll test your patch ASAP but regarding mitsuhiko's comment in the
github issue:

  @thmo these files are not imported so that is not an
  issue. Bytecompilation is supposed to skip over files it cannot byte
  compile as a result of this. pip does this correctly.

Doesn't this mean that it'd be better to patch buildroot's bytecompile
code to gracefully handle this situation by mimicking pip's behaviour
in this situation?

-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170125/8b692110/attachment.asc>
