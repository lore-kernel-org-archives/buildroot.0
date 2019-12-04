From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 08:52:29 +0100
Subject: [Buildroot] [PATCH v1 3/4] package/docker-engine: bump to
 19.03.5
In-Reply-To: <CA+h8R2rKKbJbg2-BEOekcs2en+rf-TPkakmvN6_Oc+FQNe-KiA@mail.gmail.com>
References: <20191203045003.145746-1-christian@paral.in>
 <20191203045003.145746-3-christian@paral.in>
 <20191203085731.6d12aa82@windsurf>
 <CA+h8R2rKKbJbg2-BEOekcs2en+rf-TPkakmvN6_Oc+FQNe-KiA@mail.gmail.com>
Message-ID: <20191204085229.56064f6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 3 Dec 2019 18:18:21 -0800
Christian Stewart <christian@paral.in> wrote:

> > A quick question: did you check that the test_docker_compose.py test we
> > have in Buildroot continues to work with this series applied ?  
> 
> Where can I find some documentation on how to run this script on the
> target? I tried without success.

The runtime tests do not run on the target, they run on your build
machine: they build a specific Buildroot configuration, boot it under
Qemu, and verifies that a number of things work properly.

To run it:

 ./support/testing/run-tests -k tests.package.test_docker_compose.TestDockerCompose

The -k option asks run-tests to keep the build directory around, so
that if the test fails, you can easily re-run it without having to
rebuild everything.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
