From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 16:37:58 -0400
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
In-Reply-To: <87funscc31.fsf@dell.be.48ers.dk>
References: <1476852805-11450-1-git-send-email-christian@paral.in>
 <877f94g4lm.fsf@dell.be.48ers.dk>
 <CA+h8R2pw90+-9eESPYc3E0oRbGKZg0R3Np90zxN9DmbJ43nbpQ@mail.gmail.com>
 <87funscc31.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2q6ahe+-XJ=yGXeOC0H7imX_sSPzEXiVF9JT2UYfAA_Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, Oct 19, 2016 at 4:34 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> It doesn't seem to ensure /var/lib/docker is available, so that could be
> added as well.

Meaning, making sure the directory exists?

> Docker afaik also has a number of runtime dependencies on E.G. iptables
> and iproute2, so it would be good if the docker-engine package would
> select those.

When I was originally writing the docker-engine packages I had these
selected, but it turns out these are not actually required to run
Docker. It uses its own internal syscalls.

Best,
Christian
