From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 23:30:13 +0100
Subject: [Buildroot] Docker.sock problem
In-Reply-To: <AM0PR04MB5699FBDFAB694D96AA1C990ECF990@AM0PR04MB5699.eurprd04.prod.outlook.com>
 (Bedran Atug's message of "Wed, 23 Jan 2019 23:46:12 +0000")
References: <AM0PR04MB5699FBDFAB694D96AA1C990ECF990@AM0PR04MB5699.eurprd04.prod.outlook.com>
Message-ID: <87o97xzslm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bedran" == Bedran Atug <bedoo47@hotmail.de> writes:

 > Hello,
 > I have created an image with Buildroot. I wanted to install Docker
 > inside my image. All docker commands work, but when I start a docker
 > container like docker run hello-world, I get the following problem:
 > Cannot connect to the Docker daemon at unix:/var/run/docker.sock. Is
 > the docker daemon running?
 > I already looked in the var/run/ directory but there is no docker.sock file there.

The issue is that the docker-engine package currently does not provide
an init script to start dockerd at bootup.

I have submitted a patch to add a init script:

https://patchwork.ozlabs.org/patch/1033807/

-- 
Bye, Peter Korsgaard
