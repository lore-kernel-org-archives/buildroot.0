From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 23:38:35 +0200
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <dd7ec6aa-0778-8e92-b031-cbc82c982005@lucaceresoli.net>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <dd7ec6aa-0778-8e92-b031-cbc82c982005@lucaceresoli.net>
Message-ID: <20170507233835.2afdeb9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 May 2017 23:07:31 +0200, Luca Ceresoli wrote:

> Things that I already commented about and for which I plan to send patches:
> - remove smart_open
> - document code
> - better reporting

Great!

> > +ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"  
> 
> Since you renamed artefacts to artifacts, it's probably good to rename
> in the URL too (and update the server). Sure it's a minor nit, but since
> it's an URL that should stay available for long, better having it fixed
> as soon as possible.

Correct, I'll fix that up.


> > +            qemu_cmd += ["-kernel", kernel]  
> 
> I'm OK with the "builtin" logic, but I really dislike it being
> hard-coded in Emulator.boot(). It's acceptable for the moment since we
> have only very few builtin kernels. Should we add more in the future, I
> think we should at least have a sort of "database" of builtin kernels,
> perhaps in the form of an associative array.

Fully agreed. What we have now is OK for a few kernel/qemu setups, but
clearly does not scale, and will have to be improved.

> Stylish note: I would put the one-letter form before the long form. This
> is not only my personal taste, but also what the manpages usually do,
> and what Python does with the automatically-added -h/--help parameter:

Indeed. Patch welcome! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
