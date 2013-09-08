From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Sep 2013 16:32:18 +0200
Subject: [Buildroot] [PATCH 1/3] knock: new package
In-Reply-To: <1DD66D3B-6E8F-41C4-859E-A36677BA0A6B@layer-7.net>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LXW8GfZzPAHkFjP_coASZ8CPNPNNc6=KjWrek94Ndn_cw@mail.gmail.com>
 <E9670545-EE12-445D-A15C-C0C3E4A4116A@layer-7.net>
 <1DD66D3B-6E8F-41C4-859E-A36677BA0A6B@layer-7.net>
Message-ID: <CAAXf6LWfhUhQ2pRwaFh6szZ=51WfPPJNB2AVwzoodV0w4XT4DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

On Sun, Sep 8, 2013 at 4:09 PM, Michael Rommel <rommel@layer-7.net> wrote:
>
> Hi Thomas,
>
> I got it. I could reproduce the issue with the missing dependency in the .mk file and have set up
> a standard tree just for testing the build process. And with the new dependency in the .mk file,
> the build succeeds.

Great.
To discover such mandatory dependencies, you can use the following idiom:
make clean toolchain knock

This will first clean the buildroot tree, build/install the toolchain,
and then build only the knock package and its dependencies. We should
probably add this to the documentation...

Another tip: for these type of dependency problems, you could also use
an external toolchain, like the Sourcery ones, to get much quicker
results. With such external toolchains, it also becomes very easy to
test some other architectures like powerpc, arm, ...

Best regards,
Thomas
