From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 21:44:02 +0200
Subject: [Buildroot] Outcome of the GSoC 2014
Message-ID: <20140915214402.05faf4fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

(Even if you don't care about GSoC, please read on, there are some
tasks needing volunteers!)

The Google Summer of Code officially ended about a month ago. In this
e-mail, we attempt to summarize what happened, and what should be done
to finalize the work that was started.

As you have probably noticed, our student for this year, Hadrien
Boutteville, has not been very active. He apparently had difficulties
focusing on the project, and when he was focusing on the project, he
was losing a lot of time on issues on which he wasn't
communicating. When the mid-term evaluation arrived, Yann and I
hesitated, but things were starting to improve with a better
organization, so we decided to validate his mid-term evaluation.

Unfortunately, not long after the mid-term evaluation, things started
being even worse, and despite Yann and I having meetings *every*
monday evening with Hadrien, we did not manage to get some real work
done. His progress was very slow, and at the end of July, some weeks
we simply had no news at all from Hadrien. So at the beginning of
August, we notified him that we wanted to terminate the GSoC
project. And then mid-August when the final evaluation had to be done,
we obviously failed him. Since we notified him of the termination of
the GSoC project, we haven't received any e-mail from him.

We can therefore conclude that this year's GSoC project was a complete
failure, even though Yann and I spent a lot more time on mentoring
than I did last year with Spenser. Next year, we probably need to be
even more strict in our selection of the students with some "testing"
tasks to be achieved to validate the student motivation and skills.

So, what was done by Hadrien are a few patches merged in Buildroot:

  ti-gfx: add patch to fix build failure with es5.x
  libsoup: add libsoup-gnome support
  cairo: add freetype and gobject support
  pango: bump to version 1.36.3
  libglib2: bump to version 2.40.0
  qt5base: fix typo
  ti-gfx: bump to version 5_01_01_01 if EABIhf is used
  Improve support of OpenGL for BeagleBone Black
  ti-gfx: select fbset as it is a runtime dependency
  busybox: add fbset to default configs
  libsoxr: new package
  libuci: remove MMU dependency with Lua binding
  libubox: Lua binding needs mmu and fix coding style
  libubox: fix build with lua option

We also have a few patches pending in patchwork from Hadrien, that
need adopters:

 * libgtk3: new package
   http://patchwork.ozlabs.org/patch/375493/

   This one is almost ready, there are still a few fixes to be made. I
   know Eric Le Bihan has also worked on libgtk3. Maybe Eric you could
   take over this effort?

 * webkit: bump to version 2.4.3
   http://patchwork.ozlabs.org/patch/375495/

   I didn't test, but this package was said to be working. However, it
   triggers a bug in make < 4.0 (for example make 3.82), which causes
   make to consume 100% CPU and not make any progress@all. Is
   someone interested in investigating this issue that is blocking a
   major bump of Webkit?

 * midori: bump to version 0.5.8
   http://patchwork.ozlabs.org/patch/375494/

   This was used to test Webkit 2. The person adopting Webkit should
   also adopt this patch.

 * qt: add X11 support
   http://patchwork.ozlabs.org/patch/370073/

   As the name suggests, adds the support for X.org to the Qt (not
   Qt5!) package. Any adopter?

It would be great to see those four patches merged in 2014.11, so
volunteers, please speak up!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
