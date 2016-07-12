From: Arne Caspari <arne.caspari@gmail.com>
Date: Tue, 12 Jul 2016 11:04:38 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <20160712105624.58817034@free-electrons.com>
References: <20160708095910.621ad48a@gmail.com>
 <20160708174043.3e1b7d11@free-electrons.com>
 <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
 <20160712101554.483fd170@gmail.com>
 <20160712105624.58817034@free-electrons.com>
Message-ID: <20160712110438.62d56296@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 12 Jul 2016 10:56:24 +0200
schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> 
> Again, could you give a Buildroot configuration, and a test scenario
> that allows us to reproduce the issue ?
> 

Thomas, 

for me the following steps reproduce the issue: 

support/scripts/scancpan XML-Parser
[Enable the perl-xml-parser module in the config]
make

Then on the target: 

perl -e "require XML::Parser"


The buildroot configuration should not matter as long as the target has
a different architecture (eg: ARM ). If it is the same architecture as
the host, it could produce binary compatible modules by accident. 

You could even verify the presence of this issue by just compiling the
perl-xml-parser module (any architecture): If you look at the build
output, you will see that the Makefile uses the configuration and
destination paths of the host perl. 

/Arne
