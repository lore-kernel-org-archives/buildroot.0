From: Christian Stewart <christian@paral.in>
Date: Tue, 04 Feb 2020 15:06:11 -0800
Subject: [Buildroot] [PATCH 2/2] package/docker-proxy: bump to feeff4
In-Reply-To: <87eew6jsx7.fsf@dell.be.48ers.dk>
References: <20200110045033.1920685-1-christian@paral.in>
 <20200110045033.1920685-2-christian@paral.in>
 <87lfqfg0ve.fsf@dell.be.48ers.dk>
 <CA+h8R2qiKXsKQsprOTAW6OeFhDPKYBcFMr5bDaUDVEr4AdiZhQ@mail.gmail.com>
 <87eew6jsx7.fsf@dell.be.48ers.dk>
Message-ID: <871rragdgc.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
> Ok. I am referring to references like this:
>
> https://github.com/moby/moby/issues/14856
>
> https://serverfault.com/questions/633604/what-is-the-point-of-the-docker-proxy-process-why-is-a-userspace-tcp-proxy-need
>
> Which makes me think that docker-proxy should be optional rather than
> unconditionally selected by docker-engine.
>
> What do you think?

We could set --userland-proxy=false on the daemon, perhaps, and remove
the docker-proxy requirement? I will do some tests on this.

I think it makes sense to first bump docker-proxy (it still is started
and used with the current configuration) and then remove it later.

Best regards,
Christian
