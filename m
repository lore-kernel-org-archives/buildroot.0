From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 May 2021 17:46:39 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be> (Arnout
 Vandecappelle's message of "Fri, 28 May 2021 13:51:26 +0200")
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
 <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
Message-ID: <87lf7y274w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Unfortunately, not so easy in practice. "daemon off" means a change in the
 > configuration file, which is typically going to be modified by the user. Also,
 > it's something that comes from nginx itself, so we'd have to patch the one that
 > gets installed by nginx (and that one will probably be overwritten anyway in an
 > overlay).

Notice that you can override the configuration on the command line with
the -g option (-g 'daemon off;') like it is typically done in
Dockerfiles:

https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile-debian.template#L106

-- 
Bye, Peter Korsgaard
