From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 21:32:15 +0100
Subject: [Buildroot] [PATCH 4/5] system: default to empty issue/hostname
	for custom skeleton
In-Reply-To: <cffd411631d99ddd729f0e29888b0fb14941889a.1389134731.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 7 Jan 2014 23:46:07 +0100")
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <cffd411631d99ddd729f0e29888b0fb14941889a.1389134731.git.yann.morin.1998@free.fr>
Message-ID: <87r48gaoc0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Sagaert Johan <sagaert.johan@skynet.be>
 > A custom skeleton may include /etc/issue and/or /etc/hostname, in
 > which case we do not want to override them.

 > But those files could also be missing from the custom skeleton, or
 > the user may want to override their content.

 > Make the current default value for isue and hostname depend on the
 > generic skeleton, and default to empty for a custom skeleton.

 > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 > [yann.morin.1998 at free.fr: change from hiding it behind SKELETON_DEFAULT
 >     to use conditional default values; move below the skeleton choice;
 >     improve help entries]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Do we really need to add this extra complexity? A custom skeleton is not
recommended (and in any case an advanced option), and the fix for
people not wanting /etc/issues / hostname overwritten is very easy, they
can just set it to the empty string.

What do others say?

-- 
Bye, Peter Korsgaard
