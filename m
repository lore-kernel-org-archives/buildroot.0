From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 20 Oct 2014 14:19:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-19
In-Reply-To: <20141020063015.87BD21017EC@stock.ovh.net>
References: <20141020063015.87BD21017EC@stock.ovh.net>
Message-ID: <54450BD8.1020206@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 10/20/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-10-19
> ===============================
>
>          mips |            modem-manager-1.4.0 | NOK | http://autobuild.buildroot.net/results/39e437786cdeec0c3d41c1ff6201cc4f907d0f73/

this fails to build because Perl-XML-Parser is not installed in the 
autobuilder host...

checking for XML::Parser... configure: error: XML::Parser perl module is 
required for intltool

...which is weird because Perl-XML-Parser is a direct dependency of 
intltool, and intltool seems to be present in the autobuilder host...

checking for intltool >= 0.40.0... 0.50.2 found

Anyway..., should we add host-intltool to MODEM_MANAGER_DEPENDENCIES?

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
