From: Assaf Inbal <shmuelzon@gmail.com>
Date: Fri, 4 May 2012 01:18:44 +0300
Subject: [Buildroot] Building For Host as Target
In-Reply-To: <20120503231726.25b32670@skate>
References: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
 <20120503181423.35715875@skate> <1654518205551106600@unknownmsgid>
 <20120503231726.25b32670@skate>
Message-ID: <-8605358054763519755@unknownmsgid>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Perhaps I didn't do a very good job of explaining what I'm after so I'll
try to do just that:

While it's true that buildroot, as is, was meant to compile an entire Linux
for embedded, it also provides other functionality. The functionality I was
after for my project was the ability to generate one large framework built
from many independent packages. Buildroot does just that. It's scalable,
package oriented with dependancies, caches downloaded packages and other
functionalities.

The project I'm working on is meant to be run on an embedded Linux platform
for which I don't build the entire file system, I received it with one I
must use, but just add my program and extra libraries needed.
For that reason I've removed the kernel and file system skeleton from build
root and a few other things from build root.
Now, after I've successfully set up everything and was able to compile the
libraries I need and a sample application using an external toolchain, I
also want to be able to build and develop on my pc since it's easier than
the target platform.
So, if build root would have the option to set the target platform the same
as the host, then all my problems would be solved.

Thanks


On 4 ???? 2012, at 00:17, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

Le Thu, 3 May 2012 23:14:30 +0300,
Assaf Inbal <shmuelzon@gmail.com> a ?crit :

While host variants will run, it means that I still need to compile

for some target platform. The output in the host directory will also

include many other things not needed. Unless someone will come up

with a better idea, I'm considering creating a new toolchain type

(along side with buildroot and "external"). If I'll be pleased with

the result I'll post a patch.


I am really not sure to understand what your use case is. The principle
of Buildroot is to generate an embedded Linux for a target platform
that has a different CPU architecture than the build platform, and
Buildroot uses cross-compilation to achieve this. If you're outside
this basic principle of Buildroot, I would probably say that Buildroot
isn't the right tool for the job you're trying to do.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120504/ecfec3a1/attachment.html>
