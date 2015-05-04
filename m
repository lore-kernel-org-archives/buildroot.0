From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 May 2015 22:17:55 +0200
Subject: [Buildroot] [PATCH v3 1/4] autobuild-run: encapsulate
 subprocess calls
In-Reply-To: <1430084873-19977-2-git-send-email-dywi@mailerd.de>
References: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
 <1430084873-19977-2-git-send-email-dywi@mailerd.de>
Message-ID: <20150504221755.561361c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Sun, 26 Apr 2015 23:47:50 +0200, Andr? Erdmann wrote:
> Preparation step for passing LANG to worker (sub-)processes,
> allows to redirect stdin/stdout/stderr, which all default to devnull now
> unless specified otherwise.
> This makes the "yes"-pipe in "make oldconfig" redundant.
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>

I'm fine with the idea, but I have a doubt about the implementation.

> +    def popen(self, cmdv, **kwargs):

> +    def run_cmd(self, cmdv, **kwargs):

> +    def run_cmd_write_to(self, outstream, cmdv, **kwargs):

> +    def run_cmd_get_stdout(self, cmdv, **kwargs):

Why are these methods part of the SysInfo class? What is the relation
between running commands, and verifying which tools are available on
the host machine?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
