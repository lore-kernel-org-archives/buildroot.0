From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 31 May 2010 21:12:08 +0200
Subject: [Buildroot] buildroot GPL question
In-Reply-To: <002f01cb00e9$af8f1180$0ead3480$@com> (Andrei Costin's message of
	"Mon, 31 May 2010 20:49:56 +0300")
References: <002f01cb00e9$af8f1180$0ead3480$@com>
Message-ID: <87eigrsx6f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrei" == Andrei Costin (lists) <lists@andreicostin.com> writes:

Hi,

I'm NOT a lawyer, so no guarantees - But this is how I interprete the
GPL in relation to BR.

 Andrei> Hi,

 Andrei> I would like someone?s advise for the course of action
 Andrei> regarding a vendor that used _buildroot_ to compile an embedded
 Andrei> linux kernel for their hardware product.
 
 Andrei> I have contacted them, and their response is below:

 Andrei> ?Thank you for your inquiry.
 Andrei> Our company is using a standard BUILDROOT environment (http://
 Andrei> buildroot.uclibc.org/) to produce the product.
 Andrei> No modifications were made on original 2.6 kernel and other applications under
 Andrei> the GPL licence.
 Andrei> therefore we recommend you connect to http://buildroot.uclibc.org to get all
 Andrei> extra information.?

That's AFAIK NOT enough. Section 3.c in the GPL (forward source requests
to your upstream) is only for noncommercial distribution, which this
doesn't sound like.

Now, Companies normally don't distribute buildroot (unless they offer it
as a SDK), so the GPL doesn't apply for buildroot itself. What it does
apply for is for any GPL licensed components used (Linux, Busybox, ..),
where the GPL clearly states:

[Must distribute source] The source code for a work means the preferred
form of the work for making modifications to it. For an executable work,
complete source code means all the source code for all modules it
contains, plus any associated interface definition files, PLUS THE
SCRIPTS USED TO CONTROL COMPILATION AND INSTALLATION OF THE
EXECUTABLE. However, as a special exception, the source code distributed
need not include anything that is normally distributed (in either source
or binary form) with the major components (compiler, kernel, and so on)
of the operating system on which the executable runs, unless that
component itself accompanies the executable.

I believe Buildroot falls under 'scripts used to control compilation'.

 Andrei> Also, their product documentation and license doesn?t mention at all GPL
 Andrei> license in relation to the linux kernel (and other stuff used).

That's bad.

 Andrei> So, given a hardware unit with embedded linux kernel built with _buildroot_,
 Andrei> what exact things does vendor have to provide:

 Andrei> -          In terms of documentation/license text?

 Andrei> -          In terms of source code and build environment (build and install
 Andrei> scripts/steps)

Again, it's normally not Buildroot itself, but the license of the
packages used. For GPL(v2) see section 2 and 3:

http://www.gnu.org/licenses/old-licenses/gpl-2.0.html

3.  You may copy and distribute the Program (or a work based on it,
    under Section 2) in object code or executable form under the terms of
    Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
       source code, which must be distributed under the terms of Sections 1
       and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
       years, to give any third party, for a charge no more than your cost
       of physically performing source distribution, a complete
       machine-readable copy of the corresponding source code, to be
       distributed under the terms of Sections 1 and 2 above on a medium
       customarily used for software interchange; or, 

    c) Accompany it with the information you received as to the offer to
       distribute corresponding source code. (This alternative is allowed
       only for noncommercial distribution and only if you received the
       program in object code or executable form with such an offer, in
       accord with Subsection b above.)

As mentioned above 3.C doesn't apply for that situation.

 Andrei> My assumptions are:

 Andrei> -          Documentation should mention the GPL license and the exact GPL
 Andrei> modules used. Also, documentation should state how to get the necessary source
 Andrei> code/configuration (FTP link, mailing address for CD order, etc.)

 Andrei> -          Source code (exact source tree or reference to an exact version/
 Andrei> revision) as well as exact configuration/makefiles used for building the
 Andrei> embedded environment (including configuration files for their buildroot
 Andrei> development environment)

That pretty much matches my understanding as well.

-- 
Bye, Peter Korsgaard
