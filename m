From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 23:00:35 +0200
Subject: [Buildroot] [PATCH 1/3] package/docker-engine: fix port
 forwarding for hosts without IPv6
In-Reply-To: <20210513210353.11335-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 13 May 2021 23:03:51 +0200")
References: <20210513210353.11335-1-peter@korsgaard.com>
Message-ID: <874kf5qbd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > docker-engine 20.10.6 broke container port forwarding for hosts without IPv6
 > support:

 > docker: Error response from daemon: driver failed programming external
 > connectivity on endpoint naughty_moore
 > (038e9ed4b5ea77e1c52462d6d04ad001fbad9beb185a6511aadc217c8a271608): Error
 > starting userland proxy: listen tcp6 [::]:80: socket: address family not
 > supported by protocol.

 > Add a libnetwork patch from an upstream pull request to fix this, after
 > adjusting the patch to apply to docker-engine (which has libnetwork vendored
 > under vendor/github.com/docker/libnetwork):

 > - https://github.com/moby/libnetwork/pull/2635,
 > - https://github.com/moby/moby/pull/42322

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
