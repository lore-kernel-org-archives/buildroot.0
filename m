From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 10 Apr 2020 23:24:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-03-28
In-Reply-To: <20200329062631.A05FE86DAF@whitealder.osuosl.org>
References: <20200329062631.A05FE86DAF@whitealder.osuosl.org>
Message-ID: <1f99043b-54f8-882c-4d74-e9a99eaca971@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 29/03/2020 ? 08:26, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Detail of runtime-test failures
> -------------------------------
> 
>              runtime-test |                        link to the job                        | orph?
> --------------------------+---------------------------------------------------------------+------
[...]
>       TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816222  | ORPH 

I'm unable to reproduce this issue on my pc or in the Docker image used in gitlab.

I used docker pull buildroot/base:20191027.2027 to download the docker image and
run the test in it.

It look like a timing issue due:

  # give some time to setup the server
  cmd += "sleep 30"

https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_python_django.py?h=2020.02.1#n18

Any idea ?

Best regards,
Romain
