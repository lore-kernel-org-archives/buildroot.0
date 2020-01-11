From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:20:34 -0800
Subject: [Buildroot] [PATCH 2/2] package/docker-proxy: bump to feeff4
In-Reply-To: <87lfqfg0ve.fsf@dell.be.48ers.dk>
References: <20200110045033.1920685-1-christian@paral.in>
 <20200110045033.1920685-2-christian@paral.in>
 <87lfqfg0ve.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2qiKXsKQsprOTAW6OeFhDPKYBcFMr5bDaUDVEr4AdiZhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Jan 10, 2020 at 12:40 AM Peter Korsgaard <peter@korsgaard.com> wrote:
> I was of the understanding that docker-proxy isn't really needed any
> more. Can you clarify?

I have build + run tested it with the latest version as built by this
patch. Docker-proxy is still used in the Gentoo build files.

There's not much information online about docker-proxy, one article
even claims that it should be a symlink to the docker binary itself.

The docker-proxy binary is executed when port-forwarding.

$ docker run -d -p 80:8080 nginx

Results in the following being run:

/usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 80
-container-ip 172.17.0.2 -container-port 8080

The binary does need to be in place, and it works fine after this
version bump. I'm not sure if it could be replaced with a symlink to
the docker binary itself.

Best regards,
Christian
