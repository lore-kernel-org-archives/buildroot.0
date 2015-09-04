From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2015 11:51:33 +0200
Subject: [Buildroot] [bug] bootwrapper runs before linking initrd
In-Reply-To: <20150904105409.53804439@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 4 Sep 2015 10:54:09 +0200")
References: <55E8C311.6000404@mentor.com>
 <20150904105409.53804439@free-electrons.com>
Message-ID: <87pp1yo6l6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > See http://lists.busybox.net/pipermail/buildroot/2014-July/101052.html
 > for a possible solution. I remember we discussed this patch during the
 > Buildroot Summer camp, but I thought we had sent some comments for
 > Jeremy to improve the patch. But it seems it wasn't done. Arnout, do
 > you remember the conclusion of our discussion?

 > I must say I'm not thrilled by making such major changes to Buildroot
 > just for the sake of this very specific use-case. But we probably don't
 > have much choice.

I don't know any details of this boot wrapper, but perhaps we could
change the package to only build the host tool and simply ask people to
write a post-image script to invoke it with the correct arguments once
the build is completely done, similar to what we do for other custom
"post processing" tasks?

-- 
Bye, Peter Korsgaard
