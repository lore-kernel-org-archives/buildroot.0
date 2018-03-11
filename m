From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:34:23 +0100
Subject: [Buildroot] [PATCH v3 4/8] docker-proxy: new package
In-Reply-To: <20180304004346.331-5-christian@paral.in> (Christian Stewart's
 message of "Sat, 3 Mar 2018 19:43:42 -0500")
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-5-christian@paral.in>
Message-ID: <87r2oq5mao.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Add docker-proxy package to Buildroot. Needed by docker-engine at
 > runtime, and previously not included. This leads to the following error
 > when attempting to port-map ports to a container:

 >   $ docker run -p 8080:8080 nginx
 >   docker: Error response from daemon: driver failed programming external
 >   connectivity on endpoint:
 >   exec: "docker-proxy": executable file not found in $PATH.

 > Docker expects the docker-proxy binary to exist in the PATH.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/Config.in                      |  1 +
 >  package/docker-proxy/Config.in         | 18 +++++++++++++
 >  package/docker-proxy/docker-proxy.hash |  2 ++
 >  package/docker-proxy/docker-proxy.mk   | 46 ++++++++++++++++++++++++++++++++++

You forgot to add a DEVELOPERS entry, so I took the liberty to add one
for you.

Committed, thanks.

-- 
Bye, Peter Korsgaard
