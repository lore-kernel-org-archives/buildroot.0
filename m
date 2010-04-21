From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 21 Apr 2010 17:06:19 +0300
Subject: [Buildroot] Anyone working on install-able packages (ipkg)
In-Reply-To: <20100417023037.1bd96a69@surf>
References: <4BC61E50.4000902@gmail.com> <20100415164504.11822b4a@surf>
	<20100417023037.1bd96a69@surf>
Message-ID: <n2sbadfd5ba1004210706ycdefbd3eva241366c36c86d83@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 17, 2010 at 3:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 15 Apr 2010 16:45:04 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
> Paulius, do you have an idea on how you'd like to handle ipkg
> generation ? I have questions like :
>
> ?* How do you handle dependencies ? As of today, the dependencies in
> ? Buildroot are expressed in terms of *source* dependencies, not
> ? *binary* dependencies.

Yes, that is problem... but source dependencies are quite close to binary ones.
Bigger problem is host dependencies and here we may need to split dependencies.

> ?* What do you put in the package ? The files usually installed in
> ? $(TARGET_DIR) ? How do we modify the package infrastructure so that
> ? the package installs its files to another location ?

Yes, files usually installed into TARGET_DIR would be installed into some temp
dir and then packaged with ipkg. I have no idea how to modify
infrastructure yet.
