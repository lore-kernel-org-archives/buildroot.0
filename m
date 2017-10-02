From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Oct 2017 21:44:56 +0200
Subject: [Buildroot] [PATCH v3] nc: new virtual package providing
	"netcat" functionality
In-Reply-To: <20171002211840.104aa3df@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 2 Oct 2017 21:18:40 +0200")
References: <20170917214558.11061-1-casantos@datacom.ind.br>
 <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
 <20171002211840.104aa3df@windsurf.home>
Message-ID: <87k20dcp1j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > What is the benefit of having a virtual package for this ?

 > Virtual packages are mainly useful when several variants of a given
 > library provide the same API, but different implementations, and we
 > have N consumers of this API. In such a case, a virtual package avoids
 > having each consumer explicitly handle every possible provider of the
 > API.

 > However, in the case of netcat, I don't see the point. Yes, you can
 > currently enable several packages that provide the netcat
 > functionality, and they will step on each other in some combinations.

 > But you can also enable several Web servers that will try to listen on
 > port 80 at boot time, leaving only one functional, and still we're not
 > going to have a "webserver" virtual package.

 > So, I don't see where the problem is, and therefore I don't think a
 > solution is necessary :-)

FYI, this is my feeling as well. The current setup afaik only has issues
if you enable more than one package providing a nc implementation (this
solution fixes it by not allowing such setup), but I'm not sure if
there's really a realistic use case where somebody would want to do this
in the first place?

-- 
Bye, Peter Korsgaard
