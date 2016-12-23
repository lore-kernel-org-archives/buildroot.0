From: Christian Stewart <christian@paral.in>
Date: Thu, 22 Dec 2016 17:40:48 -0800
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add option for
	static client
In-Reply-To: <CA+h8R2ridiC-VxhRt2X13cKAebb+pr7cDkFTEkW4nE3kutE0Sw@mail.gmail.com>
References: <1476850246-12883-1-git-send-email-christian@paral.in>
 <8737jsg4fn.fsf@dell.be.48ers.dk>
 <CA+h8R2ridiC-VxhRt2X13cKAebb+pr7cDkFTEkW4nE3kutE0Sw@mail.gmail.com>
Message-ID: <CA+h8R2pE5Lhe_9Wni0xnef+ngb3iqJw6TEzbi8hcc9Ndr_GVLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas,

On Wed, Oct 19, 2016 at 1:28 PM, Christian Stewart <christian@paral.in> wrote:
> On Wed, Oct 19, 2016 at 3:53 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>> What is the use case for docker-in-docker? Why not bind mount
>> /var/run/docker.sock instead?
>
> You need the Docker client if you want to call Docker from bash inside
> a container. This is intended for use along with bind mounting the
> docker.sock in the container. To guarantee you have the same client
> version in the host and the docker container, it's then easier to just
> bind mount both docker.sock and the docker client into the container.
> You need a static client to make sure this always works. This is why I
> added this option and have been using it myself for a long time.

I'm revisiting this pending patch as I don't think we came to a
conclusion on if it would be merged or not. I'm using the option
extensively in my projects, so I still believe it's worth merging.
Thoughts on this?

Thanks,
Christian Stewart
