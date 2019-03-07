From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Mar 2019 10:31:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5base: add
 BR2_PACKAGE_QT5BASE_OPENSSL
In-Reply-To: <CAPi7W834BsA0B8LksxUSh8Nfz5tVgLiEP_R_1fpGivzgXXZ3yA@mail.gmail.com>
 (Fabrice Fontaine's message of "Wed, 6 Mar 2019 20:34:35 +0100")
References: <20190304172808.4672-1-fontaine.fabrice@gmail.com>
 <87a7iaieoe.fsf@dell.be.48ers.dk>
 <CAPi7W834BsA0B8LksxUSh8Nfz5tVgLiEP_R_1fpGivzgXXZ3yA@mail.gmail.com>
Message-ID: <875zsvghdj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 > Dear Peter,
 >> I kept this as a blind option to not change behaviour and added the
 >> logic for the recently added libressl support for 5.6.x and committed,
 >> thanks.
 > Thanks for taking care of this however qt5enginio also fails to build
 > without SSL on QT5.6:
 > http://autobuild.buildroot.org/results/579dfa53451ad78563faaad514f47d80851c3234

 > We can't add a dependency or a select on the blind
 > BR2_PACKAGE_QT5BASE_OPENSSL option so what should we do?

I guess we should just change the select BR2_PACKAGE_OPENSSL part to:

select BR2_PACKAGE_LIBRESSL if BR2_PACKAGE_QT5_VERSION_5_6
select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_QT5_VERSION_LATEST

(and the corresponding change in the .mk)

-- 
Bye, Peter Korsgaard
