From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 17:05:12 -0400
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
In-Reply-To: <877f94cb8l.fsf@dell.be.48ers.dk>
References: <1476852805-11450-1-git-send-email-christian@paral.in>
 <877f94g4lm.fsf@dell.be.48ers.dk>
 <CA+h8R2pw90+-9eESPYc3E0oRbGKZg0R3Np90zxN9DmbJ43nbpQ@mail.gmail.com>
 <87funscc31.fsf@dell.be.48ers.dk>
 <CA+h8R2q6ahe+-XJ=yGXeOC0H7imX_sSPzEXiVF9JT2UYfAA_Vg@mail.gmail.com>
 <877f94cb8l.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2o7JnHc-ExogkKj71uqe0u0U9iiJ4j3ALkk6149BLuwVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, Oct 19, 2016 at 4:52 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Are you sure? I got errors without iptables. Running dockerd through
> strace I see several invocations of iptables:

I guess I was wrong.

Called here: https://github.com/docker/libnetwork/blob/master/iptables/iptables.go#L400

Needs modprobe binary as well.

> And then I seem to be missing something else, because it dies with:
>
>
> FATA[0004] Error starting daemon: Error initializing network controller:
> Error creating default "bridge" network: Failed to program NAT chain:
> Failed to inject docker in PREROUTING chain: iptables failed: iptables
> --wait -t nat -A PREROUTING -m addrtype --dst-type LOCAL -j DOCKER:
> iptables: No chain/target/match by that name.

This is quite strange and might just be a Docker bug. I had a look
over the binaries Docker calls and couldn't find anything else that
seems related.

Patch submitted to fix.

Best,
Christian Stewart
