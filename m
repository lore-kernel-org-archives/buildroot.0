From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 22:12:44 +0100
Subject: [Buildroot] [PATCH 1/3] python-setuptools: bumped version to 0.8
In-Reply-To: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
References: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
Message-ID: <20140213221244.117882f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohan Fletcher,

On Sat, 20 Jul 2013 22:27:12 +1200, Rohan Fletcher wrote:
> 
> Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
> ---
>  package/python-setuptools/python-setuptools.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I have integrated this patch (after adjusting it to bump to the latest
setuptools version) into a patch series that I posted at:

  http://patchwork.ozlabs.org/patch/260435/

However, regarding your patches 2/3 and 3/3, we discussed during the
Buildroot Developers Meeting, and the general opinion is that we don't
really like tools such as "pip", because they completely circumvent the
Buildroot logic, which has a number of drawbacks:

 * It does not take care of native dependencies, and quite a few Python
   modules have such dependencies.

 * It does not go through the Buildroot download infrastructure, which
   means that "make external-deps", "make source" do not work for the
   Python modules downloaded by pip.

 * It does not integrate with the Buildroot licensing infrastructure,
   which makes it more complicated to maintain an up-to-date list of
   the components installed in the generated system.

For Perl, Fran?ois Perrad has written a script that given a Perl CPAN
package creates all the necessary Buildroot packages. Such an approach
was accepted by the Buildroot developers, and maybe we should look at
having something similar for Python modules.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
