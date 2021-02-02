From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 17:52:49 +0100
Subject: [Buildroot] [git commit] package/grpc: remove obsolete patch to
 support cross-compiling
In-Reply-To: <CAAXf6LWkA7q_iZOL5P2GVTsi3FsRYxTD7jNLyMznRLdFKifD7g@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 2 Feb 2021 17:35:56
 +0100")
References: <20210202152308.CC93C865BA@busybox.osuosl.org>
 <CAAXf6LWkA7q_iZOL5P2GVTsi3FsRYxTD7jNLyMznRLdFKifD7g@mail.gmail.com>
Message-ID: <87eehyif8e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > I have now noticed that this patch breaks the case of a config where
 > collectd and grpc are enabled, but the grpc collectd plugin is not, if grpc
 > is built before collectd.
 > Collectd is autodetecting grpc and executes commands using the
 > grpc-cpp-plugin even when grpc support was disabled.
 > In the bad case, the target version of grpc-cpp-plugin is attempted to be
 > used.

 > I'm investigating the issue.

Ok, thanks. I'm hoping to tag 2021.02-rc1 by next weekend, so I'll
revert this commit by then if we haven't found a solution.

-- 
Bye, Peter Korsgaard
