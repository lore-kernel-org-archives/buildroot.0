From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 19:39:47 +0100
Subject: [Buildroot] Generating patches against packages source code
In-Reply-To: <201212291903.06705.yann.morin.1998@free.fr>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <50DF04B3.30801@petroprogram.com> <20121229171540.5bb22f40@skate>
 <201212291903.06705.yann.morin.1998@free.fr>
Message-ID: <20121229193947.2e157779@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Dec 2012 19:03:06 +0100, Yann E. MORIN wrote:

> I've found using quilt to be troublesome. For example, you absolutely
> have to tell quilt what files you are *going* to edit, otherwise,
> quilt will miss your changes. And this situation happens more often
> than not; in my experience, it happened quite often that I edited a
> file because I _knew_ where the failure was, to later find I forgot
> to tell quilt about that file, and was missing that change in the
> patch series.
> 
> So, I would recommend against using quilt; rather use the package's
> upstream repository, or at worse, create a temporary git tree just in
> the package's extracted directory: it's much more convenient and
> powerfull than using quilt.

<troll severity="strong">

That's because you're using a prehistoric, basic, limited and
feature-less text editor named vim.

Under the modern, wonderful, feature-rich text editor named Emacs,
there is something called "quilt-mode". Once you're in quilt mode,
Emacs turns all buffers of a quilt-managed project read-only, unless
that particular buffer edits a file that has been quilt-added into the
current patch.

Therefore, with quilt-mode in place, there is zero chance to
incorrectly edit a file you forgot to quilt add.

That said, even though I'm an heavy Emacs user, I'm not using
quilt-mode at the moment. I have been hit often enough with this quilt
"issue" that I no longer forget to do the quilt add. Or in fact, I
always use "quilt edit", which makes sure the file is "quilt added"
before starting up my favorite text editor.

</troll>

 :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
