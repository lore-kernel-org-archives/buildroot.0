From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 07 Mar 2017 10:51:49 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-05
In-Reply-To: <20170307000125.6516d2f9@free-electrons.com>
References: <20170306072844.3738B206EB@mail.free-electrons.com>
 <20170306210032.GC3976@free.fr> <20170307000125.6516d2f9@free-electrons.com>
Message-ID: <285f7992dab52d062324ef325dc2f503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-03-06 20:01, Thomas Petazzoni wrote:

>> >         i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/e29a22a2d9c81c87d271c2a6e7d041d36c370adc
>> >         sh4a |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6cc1212728248d5443fe9a367b4aeb3807ce623e
>> 
>> EGL not found...
> 
> Gustavo, could you have a look?

Hi.
It seems newer libepoxy requires egl even if you've got libgl.
I'll check with upstream if that's really the case and adjust the 
package or patch libepoxy (again) otherwise.

>> >      powerpc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/ab3565f6585e47573bcb62ef5e7250986c90d8e3
>> 
>> Static linking issue: polarssl build a 'benchmark' utility that links
>> with -lcrypto, which uses symbols fron libz, but libz is not pulled in
>> in a static build.
> 
> polarssl should use pkg-config to discover OpenSSL.

polarssl should go down the drain, i'll refresh the patch to do so.
Regards.
