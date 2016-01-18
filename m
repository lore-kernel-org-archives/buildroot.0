From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 23:21:08 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
	kernel "package" selected
In-Reply-To: <20160118230345.52b8f054@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 18 Jan 2016 23:03:45 +0100")
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <87y4bn6y5s.fsf@dell.be.48ers.dk>
 <20160118214704.GA3380@free.fr>
 <20160118230345.52b8f054@free-electrons.com>
Message-ID: <877fj64jhn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

>> So, do we agree that we should drop this patch?

 > I also don't like the way the patch is implemented, but I think the
 > problem raised by this patch is real. Sometimes people have kernel
 > sources that contain some custom kernel headers needed for their
 > userspace libraries/applications, and we have no mechanism to allow
 > them to use their custom kernel source for the linux-headers package,
 > which is a bit annoying.

Yeah, true. It does require that these custom header files are really
exported (so they get installed by headers_install) which in my
experience is not always the case.

What I have told people to do in the past instead is to either copy the
needed definitions into their user space code or add
-I$(LINUX_DIR)/include (if they build their kernel in Buildroot) like
E.G. xdriver_xf86-video-imx does it.

-- 
Venlig hilsen,
Peter Korsgaard 
