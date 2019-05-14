From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 May 2019 09:57:00 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-12
In-Reply-To: <20190513135520.6ced2ff2@windsurf.home>
References: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
 <20190513135520.6ced2ff2@windsurf.home>
Message-ID: <CANQCQpZFOf=0zsDVqim7R9MopGDuN6bvPOC1PNV_DO=cPXhm=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 13, 2019 at 6:55 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Giulio, Matt, Vadym, Gilles, Peter, Adrian, there are some
> questions/topics/issues for you below!
>

[snip]


> > microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/e196d77626b877dc3454d21febe20a04877c02a9 |
>
> Another weird timeout, this time on Matt's autobuilder. Matt, could you
> have a look ?
>
> But this seems to happen quite regularly, even on other autobuilder
> machines:
>
>   http://autobuild.buildroot.net/?reason=glibmm
>
> Always on microblazeel, like the timeout on "atop" discussed above. I
> guess that probably points at a compiler issue, which means it should
> be reproducible.
>

Build definitely hung (didn't even need to be on that build machine).
I'll hopefully get some time to take a deeper look later.

#74 0x00000000006ffd72 in find_base_term(rtx_def*) ()
#75 0x00000000006ffe45 in find_base_term(rtx_def*) ()
#76 0x00000000006ffd72 in find_base_term(rtx_def*) ()
#77 0x00000000006ffe45 in find_base_term(rtx_def*) ()
#78 0x00000000006ffdb0 in find_base_term(rtx_def*) ()
#79 0x0000000000703615 in true_dependence_1(rtx_def const*,
machine_mode, rtx_def*, rtx_def const*, rtx_def*, bool) ()
#80 0x0000000000e2e771 in check_mem_read_use(rtx_def**, void*) ()
#81 0x0000000000a4122d in note_uses(rtx_def**, void (*)(rtx_def**,
void*), void*) ()
#82 0x0000000000e2f80b in rest_of_handle_dse() ()
#83 0x00000000009deb9a in execute_one_pass(opt_pass*) ()
#84 0x00000000009df3e0 in execute_pass_list_1(opt_pass*) ()
#85 0x00000000009df3f2 in execute_pass_list_1(opt_pass*) ()
#86 0x00000000009df435 in execute_pass_list(function*, opt_pass*) ()
#87 0x000000000076477d in cgraph_node::expand() ()
#88 0x0000000000765f13 in symbol_table::compile() ()
#89 0x0000000000767670 in symbol_table::finalize_compilation_unit() ()
#90 0x0000000000a994b6 in compile_file() ()
